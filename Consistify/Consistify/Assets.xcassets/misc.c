
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#include <sys/socket.h>
#include <netinet/ip.h>
#include <arpa/inet.h>

#define MAX_PENDING 10
#define MAX_LINE 100


int main(int argc, char *argv[]) {


    // exit if arg count != 2
    if (argc != 2){
        printf("Incorrect arg count");
        return 1;
    }

    // port number specified in the command line arg
    int port = atoi(argv[1]);

    // Creates a socket for communication between server and client

    // Defines the socket descriptor and how the socket should be configured. 
    int s;
    if((s = socket(PF_INET, SOCK_STREAM, 0)) <0) {
        perror("simplex-talk: socket");
        exit(1);
    }

    // Default server address for socket
    char* host_addr = "127.0.0.1"; 


    struct sockaddr_in sin;
    sin.sin_family = AF_INET; 
    sin.sin_addr.s_addr = inet_addr(host_addr);  // use inet_addr to convert it to binary format that we need 
    sin.sin_port = htons(port); // use htons to convert the port provided 
    // Set all bits of the padding field to 0
    memset(sin.sin_zero, '\0', sizeof(sin.sin_zero));

    // Bind the socket to the server. This is required since a socket does not know what address it uses or what port
    if((bind(s, (struct sockaddr*)&sin, sizeof(sin)))<0) {
        perror("simplex-talk: bind");
        exit(1);
    }
    
    // Start listening
    listen(s, MAX_PENDING);
    int new_s;
    socklen_t len = sizeof(sin);
    char message[MAX_LINE];

   
    while (1){
        memset(message, 0, sizeof(message));

        // Used by server to receive incoming connections from clients
        // Generates a new socket that the server uses to send back to the client
        if((new_s = accept(s, (struct sockaddr *)&sin, &len)) <0){
            perror("simplex-talk: accept");
            exit(1);
        }
        memset(message, 0, sizeof(message));

        // Used for checks 
        int flag = 0;
        int oldVal;

        while(recv(new_s, message, sizeof(message), 0)){

            // print message then flush

            fputs(message, stdout);
            fflush(stdout);

            fputs("\n", stdout);
            fflush(stdout);

            flag++;
            // Update the flag and send it back to the client
            // Use strtok to isolate the value, convert it to an int, add 1, then convert back to string
            char tempMessage[MAX_LINE];

            // temporary holder for tokenizing
            strcpy(tempMessage,message);
            // printf("Temp message and message : %s + %s \n", tempMessage, message);

            char *token = strtok(tempMessage, " ");
            token = strtok(NULL, " ");
            if (token == NULL){
                memset(message, 0, sizeof(message));
                printf("Invalid tokens! \n");
                fflush(stdout);
                break;
            }
            // parse the token val
            int updatedSeqNumb;
            updatedSeqNumb = atoi(token);


            // add faulty check. 
            // first time client connects, so flag++ and save this old value for later
            
            // check since client repsonded so flag must be 2
            // this parsed value must be old flag + 1
            if (flag == 2){
                if (oldVal + 1 != updatedSeqNumb){
                    fprintf(stderr, "ERROR! invalid seq numb received by server\n");
                    close(new_s);
                    break;
                } else {
                    memset(message, 0, sizeof(message));
                    fflush(stdout);
                    close(new_s);
                    break;
                }
            }

            // Increment updatedSeqNumb
            // Save the old value if flag is 1, meaning first time the client connects
            // updatedSeqNumb++;
            updatedSeqNumb++;
            if (flag == 1){
                oldVal = updatedSeqNumb;
            }
            

            char intToStr[20];  
            sprintf(intToStr, "%d", updatedSeqNumb);

            char str1[] = "HELLO ";

            char messageBackToClient[MAX_LINE];
            strcpy(messageBackToClient, str1);        
            strcat(messageBackToClient, intToStr);
            // strcat(messageBackToClient, "\n");

            messageBackToClient[MAX_LINE-1] = '\0';

            // Send back to client
            int len = strlen(messageBackToClient) + 1;

            memset(message, 0, sizeof(message));
            send(new_s, messageBackToClient, len, 0);

        }
        close(new_s);
        memset(message, 0, sizeof(message));
    }

}


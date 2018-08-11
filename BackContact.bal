import ballerina/io;
import marcus/gcontacts3;
import wso2/jira7;

endpoint gcontacts3:Client gContactsEP {
    clientConfig:{
        auth:{
            accessToken:"",
            clientId:config:getAsString("CLIENT_ID"),
            clientSecret:config:getAsString("CLIENT_SECRET"),
            refreshToken:config:getAsString("REFRESH_TOKEN")
        }
    }
};

function main(string... args) {
    io:println("Hello");
}
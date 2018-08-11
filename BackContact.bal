import ballerina/io;
import marcus/gcontacts3;
import wso2/gsheets4;
import ballerina/config;

endpoint gcontacts3:Client gContactsEP {
    clientConfig:{
        auth:{
            accessToken:config:getAsString("ACCESS_TOKEN"),
            clientId:config:getAsString("CLIENT_ID"),
            clientSecret:config:getAsString("CLIENT_SECRET"),
            refreshToken:config:getAsString("REFRESH_TOKEN")
        }
    }
};

//endpoint gsheets4:Client spreadsheetEP {
//    clientConfig:{
//        auth:{
//            //accessToken:accessToken,
//            //clientId:clientId,
//            //clientSecret:clientSecret,
//            //refreshToken:refreshToken
//        }
//    }
//};

function main(string... args) {
    string userEmail = "default";

    var response = gContactsEP -> getAllContacts(userEmail);

    match response {
        xml xmlRes => {
            io:println(xmlRes);
        }
        error err => {
            io:println(err);
        }
    }
}
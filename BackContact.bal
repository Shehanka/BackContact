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

endpoint gsheets4:Client spreadsheetEP {
    clientConfig:{
        auth:{
            clientId:"574730957218-f0pn58b32dnr24sju9b707ank37c8b0o.apps.googleusercontent.com",
            clientSecret:"nxA8D1-6u-Y1t8K_zCSpcIDI",
            refreshToken:"1/b4a2gTb2zhrg218eeBTWwE0KOwjYCGUkTkFS9EcJnjc"
            //accessToken:accessToken,
            //clientId:clientId,
            //clientSecret:clientSecret,
            //refreshToken:refreshToken:"1/b4a2gTb2zhrg218eeBTWwE0KOwjYCGUkTkFS9EcJnjc"
        }
    }
};

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
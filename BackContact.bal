import ballerina/io;
import marcus/gcontacts3;
import wso2/gsheets4;

endpoint gcontacts3:Client gContactsEP {
    clientConfig:{
        auth:{
            accessToken:"ya29.Glv2Be5E25SajSSZfVogNs2iEYqlkZpXLj4WD2sfjhDAC-vQ45GITc2zEgyiTSC8Yexohunx8iRbhMJfXsDR_uO3d-N1Q0rnBZ5y5fLeeY651en1gSZPbD-Ja3oo"
            //clientId:config:getAsString("CLIENT_ID"),
            //clientSecret:config:getAsString("CLIENT_SECRET"),
            //refreshToken:config:getAsString("REFRESH_TOKEN")
        }
    }
};

endpoint gsheets4:Client spreadsheetEP {
    clientConfig:{
        auth:{
            //accessToken:accessToken,
            //clientId:clientId,
            //clientSecret:clientSecret,
            //refreshToken:refreshToken
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
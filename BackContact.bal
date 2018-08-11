import ballerina/io;
import marcus/gcontacts3;
import wso2/jira7;

endpoint gcontacts3:Client gContactsEP {
    clientConfig:{
        auth:{
            accessToken:"ya29.Glv2Be5E25SajSSZfVogNs2iEYqlkZpXLj4WD2sfjhDAC-vQ45GITc2zEgyiTSC8Yexohunx8iRbhMJfXsDR_uO3d-N1Q0rnBZ5y5fLeeY651en1gSZPbD-Ja3oo",
            clientId:config:getAsString("CLIENT_ID"),
            clientSecret:config:getAsString("CLIENT_SECRET"),
            refreshToken:config:getAsString("REFRESH_TOKEN")
        }
    }
};

function main(string... args) {
    io:println("Hello");
}
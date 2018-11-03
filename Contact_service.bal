// A system package containing protocol access constructs
// Package objects referenced with 'http:' in code
import ballerina/http;
import marcus/gcontacts3;
import ballerina/config;
import ballerina/io;


endpoint http:Listener listener {
    port:9090
};

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


function validate(string input) returns @untainted string {
    string regEx = "[^a-zA-Z]";
    return input.replace(regEx, "");
}

service<http:Service> serviceMain bind listener {

  
    getContent (endpoint caller, http:Request request) {
        string userEmail = "default";
        var response = gContactsEP -> getAllContacts (userEmail);
        string name;
        match response {
            xml xmlRes => {
                name = xmlRes.elements().getTextValue();
            }
            error err => {
                io:println(err);
            }
        }
        string res = validate(name);
        //Create object to carry data back to caller
        http:Response httpresponse = new;

        // Objects and structs can have function calls
        httpresponse.setTextPayload(res);

        // Send a response back to caller
        // Errors are ignored with '_'
        // -> indicates a synchronous network-bound call
        _ = caller -> respond(httpresponse);
    }
}
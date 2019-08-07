// Copyright (c) 2018 Ipanera Labs (http://www.ipaneralabs.org) All Rights Reserved.
//
// Ipanera Labs licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied. See the License for the
// specific language governing permissions and limitations
// under the License.

//This code attempts to create an MQTT service which all clients subsribe. The subscription server uses
//Apache ActiveMQ Artemis as an embedded message brokering service. This service implements the basic ipc protocol



import ballerina/artemis;
import ballerina/log;
import ballerina/io;
import ballerina

@artemis:ServiceConfig {
    queueConfig: {
        queueName: "my_queue",
        addressName: "kp1.app1.#",
        routingType: artemis:MULTICAST
    }
}

service artemisConsumer on new artemis:Listener({host:"localhost", port:61616}) {

    resource function onMessage(artemis:Message message) {

        var payload = message.getPayload();


        //TODO Identify client using web token
        io:print("Payload is ");

        //TODO If client if identified then bridge to extension services using NATS protocol
        if (payload is map<string>) {
            io:println("map<string>");
        } else if (payload is map<int>) {
            io:println("int map");
        } else if (payload is string) {
            io:println("string");
        } else if (payload is byte[]) {
            io:println("byte[]");
        } else if (payload is map<byte[]>) {
            io:println("map<byte[]>");
        } else if (payload is map<boolean>) {
            io:println("map<boolean>");
        } else if (payload is map<float>) {
            io:println("map<float>");
        }

        io:println(payload);
    }
}

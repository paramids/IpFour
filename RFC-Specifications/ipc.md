

# Introduction

This document describes general requirements, principles, design, and guidelines for IpFour Protocol (IP) version 1.
IP is a standard protocol designed to connect client applications and endpoints to a Ipanera IpFour server implemented
using Ballerina Platform. These protocols are based on the Kaa Protocol rfc provided in the kaa iot project.

# Language

The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT", "SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this document are to be interpreted as described in [RFC 2119](https://tools.ietf.org/html/rfc2119).

The following terms and definitions are used in this RFC.

- **Endpoint**: a primary entity managed by the Kaa platform that represents either a physical or a virtual device (thing).
Platform users are interested in differentiating between endpoints.

- **Client**: an application that represents one or multiple endpoints to Kaa server.

- **Endpoint token**: an opaque data blob that uniquely identifies an endpoint.
Each token is assigned to exactly one endpoint.

- **Resource path**: a unique resource identifier included in each request.
For MQTT, that is Topic Name, for CoAP — URI-Paths.

- **Extension**: a coherent set of platform functionality offered to clients/endpoints by IpFour server.
An extension implements a function-specific communication pattern (protocol) and is usually represented by one or more separate KP resources.



# Requirements and constraints

- Asynchronous messaging.
- Encrypted and unencrypted channels.
- Binding to [MQTT](http://mqtt.org/) version 3.1 and newer.
Compatibility with MQTT/MQTT-SN gateways.
- Extensibility, support for future extensions.
- Client authentication.
- Endpoint identification (but not necessarily authentication).
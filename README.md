# Getting Started

## Introduction

Dealbook provides a simple RESTful web API where each type of resource (e.g. a company, an investor, a deal) has a URI that you can interact with.

For example, if you’d like to use the API to get information about company ContaAzul, you’d use the following URI:

https://api.dealbook.co/1/company/conta-azul

### Notes:

* All API requests go to https://api.dealbook.co
* The /1 part of the URI is the API version
* The /boards part means that we’re addressing Dealbook's collection of companies
* The /conta-azul part is the slug of the board that we want to interact with.

The simplest thing you can do with a Trello resource URI is GET it. (When using REST API via HTTP, you “read” something by using the HTTP GET method).

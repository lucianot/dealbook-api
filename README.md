# Getting Started

## Introduction

Dealbook provides a simple RESTful web API where each type of resource (e.g. a company, an investor, a deal) has a URI that you can interact with.

For example, if you’d like to use the API to get information about company ContaAzul, you’d use the following URI:

https://api.dealbook.co/1/company/1

### Notes:

* All API requests go to https://api.dealbook.co
* The /1 part of the URI is the API version
* The /boards part means that we’re addressing Dealbook's collection of companies
* The /1 part is the id of the company that we want to interact with.

The simplest thing you can do with a Trello resource URI is GET it. (When using REST API via HTTP, you “read” something by using the HTTP GET method).


# Requests

## Company

### GET /1/companies
  * Examples
 
  `https://api.dealbook.co/1/companies`
  ```
  [{
    "id":1,
    "name":"Magnetis",
    "description":"Magnetis is an online financial advisor"
    "website":"magnetis.com.br"
    "markets":"Personal Finance"
    "location":"São Paulo, Brazil"
    "created_at":"2014-08-10T22:17:20.080Z",
    "updated_at":"2014-08-10T22:17:20.080Z"
  }, {
    "id":2,
    "name":"RockContent",
    "description":"RockContent is an online content marketing service"
    "website":"rockcontent.com"
    "markets":"Content Marketing"
    "location":"Belo Horizonte, Brazil"
    "created_at":"2014-08-10T22:17:28.160Z",
    "updated_at":"2014-08-10T22:17:28.160Z"
  }]
  ```

### GET /1/companies/[company id]
  * Examples
 
  `https://api.dealbook.co/1/companies/1`
  ```
  {
    "id":1,
    "name":"Magnetis",
    "description":"Magnetis is an online financial advisor"
    "website":"magnetis.com.br"
    "markets":"Personal Finance"
    "location":"São Paulo, Brazil"
    "created_at":"2014-08-10T22:17:20.080Z",
    "updated_at":"2014-08-10T22:17:20.080Z"
  }
  ```

### POST /1/companies

* Arguments
  * name (required)
    * Valid Values: a string with a length from 1 to 16384
  * website (optional)
    * Valid Values: a string with a length from 0 to 16384
  * description (optional)
    * Valid Values: a string with a length from 0 to 16384
  * markets (optional)
    * Valid Values: a string with a length from 0 to 16384
  * location (optional)
    * Valid Values: a string with a length from 0 to 16384
* Examples

  `https://api.dealbook.co/1/companies/3?name='ContaAzul'&website='contaazul.com'`
  ```
  {
    "id":3,
    "name":"ContaAzul",
    "website":"contaazul.com"
    "created_at":"2014-08-10T22:17:20.080Z",
    "updated_at":"2014-08-10T22:17:20.080Z"
  }
  ```

### PATCH /1/companies/[company id]
* Arguments
  * name (optional)
    * Valid Values: a string with a length from 0 to 16384
  * website (optional)
    * Valid Values: a string with a length from 0 to 16384
  * description (optional)
    * Valid Values: a string with a length from 0 to 16384
  * markets (optional)
    * Valid Values: a string with a length from 0 to 16384
  * location (optional)
    * Valid Values: a string with a length from 0 to 16384
* Examples

  `https://api.dealbook.co/1/companies/3?description='ContaAzul is an online bookkeeping service for SMBs'`
  ```
  {
    "id":3,
    "name":"ContaAzul",
    "description":"ContaAzul is an online bookkeeping service for SMBs"
    "website":"contaazul.com"
    "created_at":"2014-08-10T22:17:20.080Z",
    "updated_at":"2014-08-10T22:17:20.080Z"
  }

### DELETE /1/companies/[company id]


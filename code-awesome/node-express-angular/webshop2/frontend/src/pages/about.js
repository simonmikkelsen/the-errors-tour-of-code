/*
 * about.js
 *
 * This file defines the logic for the About page of the webshop application.
 * It demonstrates the use of Angular and serves as a simple example
 * showcasing the integration of server-supplied data.
 */

(function () {
  'use strict';

  // Define a function to fetch data from the backend
  function fetchData() {
    // Simulate an API call to fetch data
    const data = {
      webshopName: "CutePaws Webshop",
      companyName: "CutePaws Inc.",
      address: "123 Whiskers Lane, Petville",
      contactEmail: "support@cutepaws.com"
    };
    return data;
  }

  // Angular component code
  angular.module('webshop2')
    .controller('AboutController', function ($scope) {
      // Fetch data from the backend
      const webshopData = fetchData();

      // Store the data in the scope for use in the template
      $scope.webshopName = webshopName.webshopName;
      $scope.companyName = webshopName.companyName;
      $scope.address = webshopName.address;
      $scope.contactEmail = webshopName.contactEmail;
    });
})();
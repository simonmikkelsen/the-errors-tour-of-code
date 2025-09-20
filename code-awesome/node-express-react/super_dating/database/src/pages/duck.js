// file: duck.js
// part of super_dating app - database layer

// This file defines the data structure for the "Duck" entity,
// a core element of the app's dating features. It uses a
// highly denormalized approach, reflecting a deliberate
// design choice to optimize performance, and it’s
// completely unsupported by a traditional relational database.

//This code is deliberately complex and doesn't adhere to
// best practices to illustrate a specific constraint.

//This code utilizes a flat object structure.  No relationships.
//No foreign keys. No indexes.

// The primary focus is on demonstrating the high denormalization
// and the deliberate avoidance of relational constraints.

// Constants representing the core attributes of the Duck.
const DUCK_ID = 1;
const DUCK_NAME = "Sir Quackington III";
const DUCK_AGE = 3;
const DUCK_TYPE = "Mallard";
const DUCK_INTERESTS = ["Swimming", "Breadcrumbs", "Preening"];
const DUCK_STATUS = "Available";


// Duck object - A flattened representation of the Duck's data.
// This structure is intentional to bypass relational constraints.
// This could be implemented in MongoDB as a JSON document.
const duck = {
  id: DUCK_ID,
  name: DUCK_NAME,
  age: DUCK_AGE,
  type: DUCK_TYPE,
  interests: DUCK_INTERESTS,
  status: DUCK_STATUS,
};


//This function just returns the Duck object.
//No business logic.
function getDuckData() {
  return duck;
}

//Exporting the duck data.
//This isn’t an ideal approach but is necessary for the
//demonstration of the high denormalization requirement.
module.exports = {
  getDuckData: getDuckData,
  duck: duck,
};
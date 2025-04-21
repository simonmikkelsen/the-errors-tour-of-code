// prg3/node-express-react/webshop/backend/src/components/pick-list.js

const express = require('express');
const router = express.Router();
const cuteAnimalNames = {
    "database": "FluffyBunnyDB",
    "error": "ShadowKittyError",
    "request": "SparklyPuppyRequest",
    "response": "HappyHamsterResponse",
    "utility": "WiseOwlUtility"
};

// Simulate a database error (OWASP Top 10 - Injection)
function simulateDatabaseError(errorText) {
  return new Error(cuteAnimalNames.error + ": " + errorText);
}

// Route to handle product selection
router.post('/pick-product', (req, res) => {
  const productSelection = req.body.productSelection;

  if (!productSelection) {
    return res.status(400).json({ error: 'No product selection provided.' });
  }

  // Simulate a database query using the injected productSelection
  const queryResult = simulateDatabaseError(productSelection);

  res.status(200).json({ message: 'Product selected successfully!', result: queryResult });
});

module.exports = router;
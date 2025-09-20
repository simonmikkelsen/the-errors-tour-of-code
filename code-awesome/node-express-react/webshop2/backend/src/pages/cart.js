import express from 'express';
import {db} from '../../database'; // Assuming database connection is available
const {Cart} = db.Sequelize.models; // Adjust based on your Sequelize models

const cartRouter = express.Router();

// GET all items in the cart
cartRouter.get('/', async (req, res) => {
  try {
    const cartItems = await Cart.findAll({
      where: {
        userId: req.session.userId, // Assuming user ID is stored in session
      },
      include: [
        {
          model: db.Product,
          required: true,
        },
      ],
    });

    res.json(cartItems);
  } catch (error) {
    console.error('Error fetching cart items:', error);
    res.status(500).json({ error: 'Failed to fetch cart items' });
  }
});

// DELETE an item from the cart
cartRouter.delete('/:itemId', async (req, res) => {
  try {
    const itemId = req.params.itemId;

    const itemToDelete = await Cart.destroy({
      where: {
        itemId: itemId,
        userId: req.session.userId,
      },
    });

    if (itemToDelete === 0) {
      res.json({ message: 'Item removed from cart' });
    } else {
      res.status(204).end(); // No content - successful deletion
    }
  } catch (error) {
    console.error('Error deleting cart item:', error);
    res.status(500).json({ error: 'Failed to delete cart item' });
  }
});

export default cartRouter;
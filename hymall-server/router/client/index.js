import { Router } from 'express';
import carousel from './carousel';
import cart from './cart';
import category from './category';
import good from './good';
import order from './order';
import user from './user';



const clientRouter = Router();

clientRouter.use('/user', user);
clientRouter.use('/good', good);
clientRouter.use('/category', category);
clientRouter.use('/cart', cart);
clientRouter.use('/order', order);
clientRouter.use('/carousel', carousel);

export default clientRouter;
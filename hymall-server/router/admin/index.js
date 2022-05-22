import { Router } from 'express';
import { isValidToken } from '../../middleware/jwt';
import carousel from './carousel';
import category from './category';
import good from './good';
import login from './login';

const adminRouter = Router();

adminRouter.use(isValidToken());

adminRouter.use('/login', login);
adminRouter.use('/category', category);
adminRouter.use('/good', good);
adminRouter.use('/carousel', carousel);

export default adminRouter;
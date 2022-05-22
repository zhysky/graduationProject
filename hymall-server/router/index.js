import { Router } from 'express';
import adminRouter from './admin';
import clientRouter from './client';

import upload from './upload';
import { isValidToken } from '../middleware/jwt';

const router = Router();

router.use('/admin/api', adminRouter);
router.use('/api', clientRouter);
router.use('/upload', isValidToken(), upload);

export default router;
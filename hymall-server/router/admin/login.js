import { Router } from 'express';
import Admin from '../../entity/Admin.entity';
import { createToken } from '../../middleware/jwt';

const login = Router();

login.post('/', async (req, res) => {
    const { name = '', password = '' } = req.body;
    const admin = await Admin.findOne({ where: { name } });
    if (admin && Admin.verifyPassword(password, admin.password)) {
        const token = createToken({ name: admin.name }, '30m');
        res.send({
            code: 1,
            name,
            token,
            message: '登录成功'
        });
    } else {
        res.status(401).send({
            code: 0,
            message: '用户名或密码不正确'
        });
    }
});

export default login;
import jwt from 'jsonwebtoken';

const { JWT_SECRET: jwtSecret } = process.env;

/**
 * @param {*} payload
 * @param {string|number} time
 */
export function createToken(payload = {}, time = '1h') {
	return jwt.sign(payload, jwtSecret, { expiresIn: time });
}

/**
 * @param {string[]} path
 */
export function isValidToken(path = ['/login']) {
	return function (req, res, next) {
		if (path.includes(req.path)) {
			next();
		} else {
			let bearerToken = req.headers?.authorization;
			try {
				let token = bearerToken.split(' ').pop();
				if (tokenVerify(token)) next();
				else res.status(401).send({
					code: 0,
					message: '请先登录'
				});
			} catch (err) {
				res.status(401).send({
					code: 0,
					message: '请登录后访问'
				});
			}
		}
	};
}

/**
 * @param {string} token 
 */
function tokenVerify(token) {
	try {
		jwt.verify(token, jwtSecret);
		return true;
	} catch (error) {
		return false;
	}
}
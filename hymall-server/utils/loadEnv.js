import dotenv from 'dotenv';

const { NODE_ENV } = process.env;

NODE_ENV === 'development'
	? ({ path: './env/.env.development' }) |> dotenv.config
	: ({ path: './env/.env.production' }) |> dotenv.config;
import Admin from '../entity/Admin.entity';

export async function init() {
  const admin = await Admin.find({ where: { name: 'admin' } });

  !admin.length
    ? ({
      name: 'admin',
      password: '123456'
    }) |> Admin.create |> Admin.save
    : Admin.verifyPassword('123456', admin[0].password) |> console.log;
}
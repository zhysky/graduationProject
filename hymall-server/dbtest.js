import { createConnection } from 'typeorm';
import Good from './entity/Good.entity';
import Category from './entity/Category.entity';
import GoodInfo from './entity/GoodInfo.entity';


({
  type: 'mysql',
  host: 'localhost',
  port: 3306,
  username: 'root',
  password: 'sql123459',
  database: 'ttt',
  entities: [__dirname + '/entity/*.entity.js'],
  synchronize: true
} |> createConnection).then(async () => {
  console.log('数据库连接成功');


  // const [漫画, 小说, 手机, 电脑, 男装, 诗歌, 女装, 耳机, 水果, 球类, 游泳, 名著, 相机, 鞋帽, 工具书, 智能手表, 室内休闲, 方便速食, 糖果巧克力] = await Promise.all([
  //   Category.findOne('1fc9b29a-989a-4803-beff-8bc56c06a5fa'),
  //   Category.findOne('250b0fcf-11fd-41f6-a8cf-8fc803346f3d'),
  //   Category.findOne('354afd53-ddd8-4360-98bc-8ff3d58e43fd'),
  //   Category.findOne('3a8bd027-0022-4b76-b7d0-30c8d333f4ad'),
  //   Category.findOne('49269c1a-64a2-440d-a06a-bf09a8cc2dc8'),
  //   Category.findOne('4af1b829-a505-4f1c-adbd-8a371c8e0a37'),
  //   Category.findOne('5133c153-f22c-4469-af09-e31e93e8316d'),
  //   Category.findOne('740feee1-ed96-40fb-ad81-e9b52a1c9561'),
  //   Category.findOne('7e07bff4-91c2-44a3-a247-de8147c9f1d8'),
  //   Category.findOne('8a6fd592-8daa-4b09-bd7b-7cf47cfd5aac'),
  //   Category.findOne('9afda963-83a6-4136-a44e-3020c3cbda01'),
  //   Category.findOne('9e79a19d-5705-4920-aacd-de5806c47f5f'),
  //   Category.findOne('c4b83b03-52c1-411e-98d4-b925dabda83c'),
  //   Category.findOne('ec8facca-74e1-40f5-ab1b-810ca9529e07'),
  //   Category.findOne('ed7aa682-f148-4158-a25f-ade0c6fda6d2'),
  //   Category.findOne('0b088f1e-c803-43af-bdf2-ce1ad0605b47'),
  //   Category.findOne('84efebd9-4e8b-449b-b083-03350f047e60'),
  //   Category.findOne('854d23a1-e6f8-4d3e-9662-1126d6abac36'),
  //   Category.findOne('4f8eec3b-cef9-4b8c-a1bc-f5f575b48450')]);


  const [漫画, 小说, 手机, 电脑, 男装, 诗歌, 女装, 耳机, 水果, 球类, 游泳, 名著, 相机, 鞋帽, 工具书, 智能手表, 室内休闲, 方便速食, 糖果巧克力] = [
    '1fc9b29a-989a-4803-beff-8bc56c06a5fa' |> Category.findOne,
    '250b0fcf-11fd-41f6-a8cf-8fc803346f3d' |> Category.findOne,
    '354afd53-ddd8-4360-98bc-8ff3d58e43fd' |> Category.findOne,
    '3a8bd027-0022-4b76-b7d0-30c8d333f4ad' |> Category.findOne,
    '49269c1a-64a2-440d-a06a-bf09a8cc2dc8' |> Category.findOne,
    '4af1b829-a505-4f1c-adbd-8a371c8e0a37' |> Category.findOne,
    '5133c153-f22c-4469-af09-e31e93e8316d' |> Category.findOne,
    '740feee1-ed96-40fb-ad81-e9b52a1c9561' |> Category.findOne,
    '7e07bff4-91c2-44a3-a247-de8147c9f1d8' |> Category.findOne,
    '8a6fd592-8daa-4b09-bd7b-7cf47cfd5aac' |> Category.findOne,
    '9afda963-83a6-4136-a44e-3020c3cbda01' |> Category.findOne,
    '9e79a19d-5705-4920-aacd-de5806c47f5f' |> Category.findOne,
    'c4b83b03-52c1-411e-98d4-b925dabda83c' |> Category.findOne,
    'ec8facca-74e1-40f5-ab1b-810ca9529e07' |> Category.findOne,
    'ed7aa682-f148-4158-a25f-ade0c6fda6d2' |> Category.findOne,
    '0b088f1e-c803-43af-bdf2-ce1ad0605b47' |> Category.findOne,
    '84efebd9-4e8b-449b-b083-03350f047e60' |> Category.findOne,
    '854d23a1-e6f8-4d3e-9662-1126d6abac36' |> Category.findOne,
    '4f8eec3b-cef9-4b8c-a1bc-f5f575b48450' |> Category.findOne,
  ];

  const categoryList = [智能手表, 电脑, 漫画, 小说, 手机, 男装, 诗歌, 女装, 耳机, 水果, 球类, 游泳, 名著, 相机, 鞋帽, 工具书, 室内休闲, 方便速食, 糖果巧克力];


  for await (const category of categoryList) {
    let good = await Good.findOne({
      where: {
        category: category,
      },
      relations: ['category', 'goodInfo'],
    });
    for (let i = 2; i < 100; i++) {
      let newGood = Good.create();
      let newGoodInfo = GoodInfo.create();
      newGood.name = `${category.name}${i}号`;
      newGood.cover = good.cover;
      newGood.price = good.price;
      newGood.tag = '默认';
      newGood.goodInfo = newGoodInfo;
      newGood.goodInfo.inventory = good.goodInfo.inventory;
      newGood.goodInfo.sales = good.goodInfo.sales;
      newGood.goodInfo.pictures = good.goodInfo.pictures;
      newGood.goodInfo.describe = good.goodInfo.describe;
      newGood.goodInfo.details = good.goodInfo.details;
      newGood.category = category;

      await (newGood |> Good.save) |> (_ => _.name) |> console.log;
    }
  }

}).catch(err => console.log('数据库连接失败', err));


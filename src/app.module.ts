import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { TsxViewsModule } from 'nestjs-tsx-views';

import SQLite from 'better-sqlite3';

import { resolve } from 'path';
import { KyselyModule } from 'nestjs-kysely';
import { SqliteDialect } from 'kysely';

@Module({
  imports: [
    TsxViewsModule.register({
      viewsDirectory: resolve(__dirname, './views'),
      prettify: true,
      forRoutes: [AppController],
    }),
    KyselyModule.forRoot({
      dialect: new SqliteDialect({
        database: new SQLite(':memory:'),
      }),
    }),
  ],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}

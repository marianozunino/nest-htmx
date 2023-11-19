import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';

import SQLite from 'better-sqlite3';

import { KyselyModule } from 'nestjs-kysely';
import { SqliteDialect } from 'kysely';
import { RenderInterceptor } from './render.interceptor';
import { APP_INTERCEPTOR } from '@nestjs/core';

@Module({
  imports: [
    KyselyModule.forRoot({
      dialect: new SqliteDialect({
        database: new SQLite(':memory:'),
      }),
    }),
  ],
  controllers: [AppController],
  providers: [
    AppService,
    { provide: APP_INTERCEPTOR, useClass: RenderInterceptor },
  ],
})
export class AppModule {}

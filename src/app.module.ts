import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { TsxViewsModule } from 'nestjs-tsx-views';
import { resolve } from 'path';

@Module({
  imports: [
    TsxViewsModule.register({
      viewsDirectory: resolve(__dirname, './views'),
      prettify: true,
      forRoutes: [AppController],
    }),
  ],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}

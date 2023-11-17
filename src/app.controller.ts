import { Body, Controller, Get, Post, Render } from '@nestjs/common';
import { AppService } from './app.service';

@Controller()
export class AppController {
  constructor(private readonly appService: AppService) {}

  @Post('/hello')
  @Render('hello')
  ok(@Body() body: any): any {
    console.log(body);
    return { name: body.name };
  }

  @Get()
  @Render('index')
  getHello(): any {
    return {};
  }
}

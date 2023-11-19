import { Body, Controller, Get, Post } from '@nestjs/common';
import { RenderTsx } from './render.interceptor';
import { IsHtmxRequest } from './htmx.decorators';

@Controller()
export class AppController {
  private counter = 0;
  constructor() {}

  @Get()
  @RenderTsx('hello')
  public ok() {
    return { name: 'marian' };
  }

  @Post()
  @RenderTsx('component')
  public comment(@Body() body: any, @IsHtmxRequest() isHtmxRequest: boolean) {
    console.log('isHtmxRequest', isHtmxRequest);
    return { counter: this.counter++, body };
  }
}

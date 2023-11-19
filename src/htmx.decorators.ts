import { createParamDecorator, ExecutionContext } from '@nestjs/common';

export const IsHtmxRequest = createParamDecorator(
  (data: unknown, ctx: ExecutionContext) => {
    const request = ctx.switchToHttp().getRequest();
    return request.headers['hx-request'] === 'true';
  },
);

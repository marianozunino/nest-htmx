import {
  CallHandler,
  ExecutionContext,
  Injectable,
  NestInterceptor,
  SetMetadata,
} from '@nestjs/common';

import { Reflector } from '@nestjs/core';
import { join } from 'path';
import { Observable } from 'rxjs';
import { map } from 'rxjs/operators';

@Injectable()
export class RenderInterceptor implements NestInterceptor {
  constructor(private readonly reflector: Reflector) {}

  public intercept(
    context: ExecutionContext,
    next: CallHandler<any>,
  ): Observable<any> | Promise<Observable<any>> {
    const file = this.reflector.get('FILE_NAME', context.getHandler());

    return next.handle().pipe(
      map((data) => {
        return this.render(data, file);
      }),
    );
  }

  render(data: Record<string, any>, file: string): string {
    const templatePath = join(__dirname, 'views', `${file}.js`);

    // Assuming your JSX template exports a default function
    // eslint-disable-next-line @typescript-eslint/no-var-requires
    const TemplateComponent = require(templatePath).default;

    if (!TemplateComponent) {
      throw new Error(`Template ${templatePath} must have a default export`);
    }

    // Render the JSX template with data
    const renderedContent = TemplateComponent(data);

    return renderedContent;
  }
}

export function RenderTsx(file: string) {
  return SetMetadata('FILE_NAME', file);
}

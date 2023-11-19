import { Injectable } from '@nestjs/common';
import { InjectKysely } from 'nestjs-kysely';
import { DB } from './db/types';
import { Kysely } from 'kysely';

@Injectable()
export class AppService {
  constructor(@InjectKysely() private readonly db: Kysely<DB>) {}

  async getHello(): Promise<string> {
    const x = await this.db.selectFrom('events').selectAll().execute();
    return 'Hello World!';
  }
}

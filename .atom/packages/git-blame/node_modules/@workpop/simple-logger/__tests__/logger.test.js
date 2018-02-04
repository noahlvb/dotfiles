import Logger from '../src';

const simpleLogging = new Logger('SIMPLE');

const requestIdLogger = new Logger('SIMPLE', '234923423')

describe('Logger', function () {
  describe('simple logging', function () {
    it('logs errors', function () {
      simpleLogging.error('SUP');
      requestIdLogger.error('SUP');
    });
  });
});

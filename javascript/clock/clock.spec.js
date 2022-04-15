import { Clock } from './clock';

describe('Clock', () => {

  describe('Creating a new clock with an initial time', () => {
    test('on the hour', () => {
      const clock = new Clock(8);
      expect(clock.toString()).toEqual('08:00');
    });

    test('past the hour', () => {
      const clock = new Clock(11, 9);
      expect(clock.toString()).toEqual('11:09');
    });
    
    test('midnight is zero hours', () => {
      const clock = new Clock(24, 0);
      expect(clock.toString()).toEqual('00:00');
    });
    
    test('hour rolls over', () => {
      const clock = new Clock(25, 0);
      expect(clock.toString()).toEqual('01:00');
    });
    
    test('hour rolls over continuously', () => {
      const clock = new Clock(100, 0);
      expect(clock.toString()).toEqual('04:00');
    });
    
    test('sixty minutes is next hour', () => {
      const clock = new Clock(1, 60);
      expect(clock.toString()).toEqual('02:00');
    });
    
    test('minutes roll over', () => {
      const clock = new Clock(0, 160);
      expect(clock.toString()).toEqual('02:40');
    });
    
    test('minutes roll over continuously', () => {
      const clock = new Clock(0, 1723);
      expect(clock.toString()).toEqual('04:43');
    });
    
    test('hour and minutes roll over', () => {
      const clock = new Clock(25, 160);
      expect(clock.toString()).toEqual('03:40');
    });
    
    test('hour and minutes roll over continuously', () => {
      const clock = new Clock(201, 3001);
      expect(clock.toString()).toEqual('11:01');
    });
    
    test('hour and minutes roll over to exactly midnight', () => {
      const clock = new Clock(72, 8640);
      expect(clock.toString()).toEqual('00:00');
    });

    test('negative hour', () => {
      const clock = new Clock(-1, 15);
      expect(clock.toString()).toEqual('23:15');
    });
    
    test('negative hour rolls over', () => {
      const clock = new Clock(-25, 0);
      expect(clock.toString()).toEqual('23:00');
    });
    
    test('negative hour rolls over continuously', () => {
      const clock = new Clock(-91, 0);
      expect(clock.toString()).toEqual('05:00');
    });

    test('negative minutes', () => {
      const clock = new Clock(1, -40);
      expect(clock.toString()).toEqual('00:20');
    });

    test('negative minutes rolls over', () => {
      const clock = new Clock(1, -160);
      expect(clock.toString()).toEqual('22:20');
    });

    test('negative minutes rolls over continuously', () => {
      const clock = new Clock(1, -4820);
      expect(clock.toString()).toEqual('16:40');
    });

    test('negative hour and minutes both roll over', () => {
      const clock = new Clock(-25, -160);
      expect(clock.toString()).toEqual('20:20');
    });

    test('negative hour and minutes both roll over continuously', () => {
      const clock = new Clock(-121, -5810);
      expect(clock.toString()).toEqual('22:10');
    });

    describe('Adding and subtracting minutes', () => {
      test('add minutes', () => {
        const clock = new Clock(10, 0);
        expect(clock.plus(3).toString()).toEqual('10:03');
      });

      test('add no minutes', () => {
        const clock = new Clock(6, 41);
        expect(clock.plus(0).toString()).toEqual('06:41');
      });

      test('add to next hour', () => {
        const clock = new Clock(0, 45);
        expect(clock.plus(40).toString()).toEqual('01:25');
      });

      test('add more than one hour', () => {
        const clock = new Clock(10, 0);
        expect(clock.plus(61).toString()).toEqual('11:01');
      });

      test('add more than two hours with carry', () => {
        const clock = new Clock(0, 45);
        expect(clock.plus(160).toString()).toEqual('03:25');
      });

      test('add across midnight', () => {
        const clock = new Clock(23, 59);
        expect(clock.plus(2).toString()).toEqual('00:01');
      });

      test('add more than one day (1500 min = 25 hrs)', () => {
        const clock = new Clock(5, 32);
        expect(clock.plus(1500).toString()).toEqual('06:32');
      });

      test('add more than two days', () => {
        const clock = new Clock(1, 1);
        expect(clock.plus(3500).toString()).toEqual('11:21');
      });

      test('subtract minutes', () => {
        const clock = new Clock(10, 3);
        expect(clock.minus(3).toString()).toEqual('10:00');
      });

      test('subtract to previous hour', () => {
        const clock = new Clock(10, 3);
        expect(clock.minus(30).toString()).toEqual('09:33');
      });

      test('subtract more than an hour', () => {
        const clock = new Clock(10, 3);
        expect(clock.minus(70).toString()).toEqual('08:53');
      });

      test('subtract across midnight', () => {
        const clock = new Clock(0, 3);
        expect(clock.minus(4).toString()).toEqual('23:59');
      });

      test('subtract more than two hours', () => {
        const clock = new Clock(0, 0);
        expect(clock.minus(160).toString()).toEqual('21:20');
      });

      test('subtract more than two hours with borrow', () => {
        const clock = new Clock(6, 15);
        expect(clock.minus(160).toString()).toEqual('03:35');
      });

      test('subtract more than one day (1500 min = 25 hrs)', () => {
        const clock = new Clock(5, 32);
        expect(clock.minus(1500).toString()).toEqual('04:32');
      });

      test('subtract more than two days', () => {
        const clock = new Clock(2, 20);
        expect(clock.minus(3000).toString()).toEqual('00:20');
      });
    });

    describe('Construct two separate clocks, set times, test if they are equal', () => {
      test('clocks with same time', () => {
        const clock = new Clock(15, 37);
        expect(clock.equals(new Clock(15, 37))).toBeTruthy();
      });

      test('clocks a minute apart', () => {
        const clock = new Clock(15, 36);
        expect(clock.equals(new Clock(15, 37))).toBeFalsy();
      });

      test('clocks an hour apart', () => {
        const clock = new Clock(14, 37);
        expect(clock.equals(new Clock(15, 37))).toBeFalsy();
      });

      test('clocks with hour overflow', () => {
        const clock = new Clock(10, 37);
        expect(clock.equals(new Clock(34, 37))).toBeTruthy();
      });

      test('clocks with hour overflow by several days', () => {
        const clock = new Clock(3, 11);
        expect(clock.equals(new Clock(99, 11))).toBeTruthy();
      });

      test('clocks with negative hour', () => {
        const clock = new Clock(22, 40);
        expect(clock.equals(new Clock(-2, 40))).toBeTruthy();
      });

      test('clocks with negative hour that wraps', () => {
        const clock = new Clock(17, 3);
        expect(clock.equals(new Clock(-31, 3))).toBeTruthy();
      });

      test('clocks with negative hour that wraps multiple times', () => {
        const clock = new Clock(13, 49);
        expect(clock.equals(new Clock(-83, 49))).toBeTruthy();
      });

      test('clocks with minute overflow', () => {
        const clock = new Clock(0, 1);
        expect(clock.equals(new Clock(0, 1441))).toBeTruthy();
      });

      test('clocks with minute overflow by several days', () => {
        const clock = new Clock(2, 2);
        expect(clock.equals(new Clock(2, 4322))).toBeTruthy();
      });

      test('clocks with negative minute', () => {
        const clock = new Clock(2, 40);
        expect(clock.equals(new Clock(3, -20))).toBeTruthy();
      });

      test('clocks with negative minute that wraps', () => {
        const clock = new Clock(4, 10);
        expect(clock.equals(new Clock(5, -1490))).toBeTruthy();
      });

      test('clocks with negative minute that wraps multiple times', () => {
        const clock = new Clock(6, 15);
        expect(clock.equals(new Clock(6, -4305))).toBeTruthy();
      });

      test('clocks with negative hours and minutes', () => {
        const clock = new Clock(7, 32);
        expect(clock.equals(new Clock(-12, -268))).toBeTruthy();
      });

      test('clocks with negative hours and minutes that wrap', () => {
        const clock = new Clock(18, 7);
        expect(clock.equals(new Clock(-54, -11513))).toBeTruthy();
      });
    });
  });
});

return function()
  local J3Util = require(7162009730);
  local Table = J3Util.Table

  describe(
    'wrap', function()
      it(
        'pop', function()
          local t = Table.wrap({ 'a'; 'b'; 'c' });
          expect(t:pop()).to.equal('c')
          expect(t:pop()).to.equal('b')
          expect(t:pop()).to.equal('a')
          expect(function() t:pop() end).to.throw('Cannot pop an empty table!')
        end
      )
      it(
        'shift', function()
          local t = Table.wrap({ 'a'; 'b'; 'c' });
          expect(t:shift()).to.equal('a')
          expect(t:shift()).to.equal('b')
          expect(t:shift()).to.equal('c')
          expect(function() t:shift() end).to.throw('Cannot shift an empty table!')
        end
      )
    end
  )
end

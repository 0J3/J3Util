return function()
  local J3Util = require(7162009730);

  describe(
    'new', function()
      it(
        'create an instance of type Folder using only the argument of type string',
        function()
          local inst = J3Util.Instance.new('Folder')
          expect(inst.ClassName == 'Folder' and inst.raw.ClassName == 'Folder').to.be.ok()
        end
      )
      it(
        'be wrapped, allowing defining non-existant propreties', function()
          local inst = J3Util.Instance.new('Folder')
          inst.test = 'success'
          expect(inst.test == 'success').to.be.ok()
        end
      )
      it(
        'create a model named success with an array passed', function()
          local inst = J3Util.Instance
                         .new{ ['ClassName'] = 'Model'; ['Name'] = 'success' }
          expect(
            inst.ClassName == 'Model' and inst.raw.ClassName == 'Model' and inst.Name ==
              'success' and inst.raw.Name == 'success'
          ).to.be.ok()
        end
      )
      it(
        'wrap all descendants when gotten using indexing', function()
          local inst = J3Util.Instance.new('Folder')
          inst.Parent = game:GetService('Workspace')
          local sub = Instance.new('Folder')
          sub.Name = 'sub'
          sub.Parent = inst.raw

          expect(inst.sub.raw).to.be.ok()
        end
      )
    end
  )
  describe(
    'wrap', function()
      it(
        'allow extending the prototype for all wrapped instances at once', function()
          J3Util.Instance.wrap.prototype.test = 'success'
          J3Util.Instance.wrap.prototype.testF = function() return 'success2' end
          J3Util.Instance.wrap.prototype.testFWithArgs = function( uwu )
            return 's' .. uwu;
          end
          J3Util.Instance.wrap.prototype.testFWithArgs2 = function( self, uwu )
            return 's' .. uwu;
          end
          local inst = J3Util.Instance.new('Folder')
          expect(inst.test == 'success').to.be.ok()
          expect(inst.testF() == 'success2').to.be.ok()
          expect(inst.testFWithArgs('uccess') == 'success').to.be.ok()
          expect(inst:testFWithArgs2('uccess') == 'success').to.be.ok()
          local inst2 = J3Util.Instance.new('Folder')
          expect(inst2.test == 'success').to.be.ok()
          expect(inst2.testF() == 'success').to.be.ok()
          expect(inst2.testFWithArgs('uccess') == 'success').to.be.ok()
          expect(inst2:testFWithArgs2('uccess') == 'success').to.be.ok()
        end
      )
      it(
        'have a proprety named isWrapped which should be true on the prototype',
        function()
          local inst = J3Util.Instance.new('Folder')
          expect(inst.isWrapped).to.be.ok()
        end
      )
      it(
        'wrap all descendants when gotten using indexing', function()
          local inst = Instance.new('Folder')
          inst.Parent = game:GetService('Workspace')
          local sub = Instance.new('Folder');
          sub.Name = 'sub';
          sub.Parent = inst;

          expect(J3Util.Instance.wrap(inst).sub.raw).to.be.ok()
        end
      )
    end
  )
end

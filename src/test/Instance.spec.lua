return function()
  local J3Util = require(7162009730);

  describe(
    'new', function()
      it(
        'create an instance of type Folder using only the argument of type string',
        function()
          local inst = J3Util.Instance.new('Folder')
          expect(inst.ClassName == 'Folder').to.equal(true)
          expect(inst.raw.ClassName == 'Folder').to.equal(true)
        end
      )
      it(
        'be wrapped, allowing defining non-existant propreties', function()
          local inst = J3Util.Instance.new('Folder')
          inst.test = 'success'
          expect(inst.test == 'success').to.equal(true)
        end
      )
      it(
        'create a model named success with an array passed', function()
          local inst = J3Util.Instance
                         .new{ ['ClassName'] = 'Model'; ['Name'] = 'success' }
          expect(
            inst.ClassName == 'Model' and inst.raw.ClassName == 'Model' and inst.Name ==
              'success' and inst.raw.Name == 'success'
          ).to.equal(true)
        end
      )
      it(
        'wrap all descendants when gotten using indexing', function()
          local inst = J3Util.Instance.new('Folder')
          inst.Parent = game:GetService('Workspace')
          local sub = Instance.new('Folder')
          sub.Name = 'sub'
          sub.Parent = inst.raw

          expect(inst.sub.raw).to.be.a('userdata')
          expect(inst.sub.raw.name).to.equal('sub')
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
          expect(inst.test).to.equal('success')
          expect(inst.testF()).to.equal('success2')
          expect(inst.testFWithArgs('uccess')).to.equal('success')
          expect(inst:testFWithArgs2('uccess')).to.equal('success')
          local inst2 = J3Util.Instance.new('Folder')
          expect(inst2.test == 'success').to.equal(true)
          expect(inst2.testF()).to.equal('success2')
          expect(inst2.testFWithArgs('uccess') == 'success').to.equal(true)
          expect(inst2:testFWithArgs2('uccess') == 'success').to.equal(true)
        end
      )
      it(
        'have a proprety named isWrapped which should be true on the prototype',
        function()
          local inst = J3Util.Instance.new('Folder')
          expect(inst.isWrapped).to.equal(true)
        end
      )
      it(
        'wrap all descendants when gotten using indexing', function()
          local inst = Instance.new('Folder')
          inst.Parent = game:GetService('Workspace')
          local sub = Instance.new('Folder');
          sub.Name = 'sub';
          sub.Parent = inst;

          expect(J3Util.Instance.wrap(inst).sub.raw).to.be.a('userdata')
        end
      )
    end
  )
end

describe "Examinput"
     before

     end

     before_each
          examinput = new Examinput()
          JspecRails.load_fixture('examinput')
     end

     after_each
          delete examinput
          JspecRails.clear_fixture()
     end

     it "should exist"
          examinput.should.not.be null
     end

end

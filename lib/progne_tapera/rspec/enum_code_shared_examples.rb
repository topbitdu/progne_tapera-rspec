shared_examples 'ProgneTapera::EnumCode' do |model, attribute_name, enum|

  describe "##{attribute_name}" do
    it 'exists' do expect(model).to respond_to(attribute_name) end
  end

  describe "##{attribute_name}=" do

    it 'exists' do expect(model).to respond_to("#{attribute_name}=") end

    enum.each do |enum_item|
      it "should be able to assign #{enum_item.inspect} and load by ##{attribute_name}" do
        model.send "#{attribute_name}=", enum_item
        expect(model.send attribute_name).to eq(enum_item)
      end
      it "should be able to assign #{enum_item.inspect} and load by ##{attribute_name}_code" do
        model.send "#{attribute_name}=", enum_item
        expect(model.send "#{attribute_name}_code").to eq(enum_item.code)
      end
    end

  end

  describe "##{attribute_name}_code" do

    it 'exists' do expect(model).to respond_to("#{attribute_name}_code") end

  end

  describe "##{attribute_name}_code=" do

    it 'exists' do expect(model).to respond_to("#{attribute_name}_code=") end

    enum.each do |enum_item|
      it "should be able to assign #{enum_item.code.inspect} and load by ##{attribute_name}" do
        model.send "#{attribute_name}_code=", enum_item.code
        expect(model.send attribute_name).to eq(enum_item)
      end
      it "should be able to assign #{enum_item.code.inspect} and load by ##{attribute_name}_code" do
        model.send "#{attribute_name}_code=", enum_item.code
        expect(model.send "#{attribute_name}_code").to eq(enum_item.code)
      end
    end

  end

end

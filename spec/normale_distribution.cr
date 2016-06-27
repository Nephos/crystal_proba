describe NormaleDistribution do
  it "simple instances" do
    NormaleDistribution::Persistant.new
    NormaleDistribution::Persistant.new(standard_deviation: 1).standard_deviation.should eq(1)
    NormaleDistribution::Persistant.new(esperance: 1).esperance.should eq(1)
  end

  it "QI" do
    rule = NormaleDistribution::Persistant.new standard_deviation: 15, esperance: 100
    rule.between(85, 115).round(2).should eq(0.68)
  end

  it "centroid" do
    [0.1, 1, 2, 4.1324].each do |space|
      [0, 1, -1, 12, 41, 0.2, 0.233].each do |center|
        rule = NormaleDistribution::Persistant.new standard_deviation: space, esperance: center
        [0.2, 0.4, 0.45, 0.55, 0.94, 1.1].each do |diff|
          (-rule.between(diff, center)).should eq(rule.between(center, diff))
        end
      end
    end
  end

  it "must fail" do
    expect_raises { NormaleDistribution::Persistant.new standard_deviation: -1 }
    expect_raises { NormaleDistribution::Persistant.new standard_deviation: 0 }
  end

end

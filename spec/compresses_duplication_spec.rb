require_relative '../lib/compress_duplication'

describe CompressesDuplication do

  it "spots identical text" do
    first_rt = "RT @gilesgoatboy hello world!"
    second_rt = "RT @gilesgoatboy hello world!"
    CompressesDuplication.identical?(first_rt, second_rt).should be_true
  end

  it "recognizes similar text" do
  end

end


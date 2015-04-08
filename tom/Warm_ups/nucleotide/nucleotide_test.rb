require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require_relative './nucleotide'

class DNATest < MiniTest::Test
  def test_empty_dna_string_has_no_adenosine
    assert_equal 0, DNA.new('').count('A')
  end

  def test_repetitive_cytidine_gets_counted
    assert_equal 5, DNA.new('CCCCC').count('C')
  end

  def test_counts_only_thymidine
    assert_equal 1, DNA.new('GGGGGTAACCCGG').count('T')
  end

  def test_dna_has_no_uracil
    assert_equal 0, DNA.new('GATTACA').count('U')
  end

  def test_validates_nucleotides
    assert_raises ArgumentError do
      DNA.new("GACT").count('X')
    end
  end

  def test_empty_dna_string_has_no_nucleotides
    expected = { 'A' => 0, 'T' => 0, 'C' => 0, 'G' => 0, 'U' => 0 }
    assert_equal expected, DNA.new("").nucleotide_counts
  end

  def test_repetitive_sequence_has_only_guanosine
    expected = { 'A' => 0, 'T' => 0, 'C' => 0, 'G' => 8, 'U' => 0 }
    assert_equal expected, DNA.new('GGGGGGGG').nucleotide_counts
  end

  def test_counts_all_nucleotides
    s = "AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC"
    dna = DNA.new(s)
    expected = { 'A' => 20, 'T' => 21, 'G' => 17, 'C' => 12, 'U' => 0 }
    assert_equal expected, dna.nucleotide_counts
  end

  def test_invalid_multicharacter_nucleotides
    assert_raises ArgumentError do
      DNA.new("ACTG").count('AC') # Should fail, 'AC' is not a valid nucleotide.
    end
  end
end
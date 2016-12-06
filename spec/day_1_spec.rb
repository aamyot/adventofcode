require './lib/how_many_blocks'

describe HowManyBlocks do
  it "returns the number of blocks" do
    input = File.read('spec/input/day_1.txt')

    expect(HowManyBlocks.after(input)).to eq(241)
  end

  context "Number of blocks" do
    it "works when turning right" do
      expect(HowManyBlocks.after('R4')).to eq(4)
    end

    it "works when turning left" do
      expect(HowManyBlocks.after('L7')).to eq(7)
    end

    it "works when turning in both directions" do
      expect(HowManyBlocks.after('R2, L3')).to eq(5)
      expect(HowManyBlocks.after('R2, R2, R2')).to eq(2)
      expect(HowManyBlocks.after('R5, L5, R5, R3')).to eq(12)
    end
  end

  context 'Turning' do
    NORTH = [ 0,  1]
    SOUTH = [ 0, -1]
    EAST =  [ 1,  0]
    WEST =  [-1,  0]

    it 'turns right' do
      expect(HowManyBlocks.turn_right(NORTH)).to eq(EAST)
      expect(HowManyBlocks.turn_right(SOUTH)).to eq(WEST)
      expect(HowManyBlocks.turn_right(EAST)).to eq(SOUTH)
      expect(HowManyBlocks.turn_right(WEST)).to eq(NORTH)
    end

    it 'turns left' do
      expect(HowManyBlocks.turn_left(NORTH)).to eq(WEST)
      expect(HowManyBlocks.turn_left(SOUTH)).to eq(EAST)
      expect(HowManyBlocks.turn_left(EAST)).to eq(NORTH)
      expect(HowManyBlocks.turn_left(WEST)).to eq(SOUTH)
    end

    it 'turns in the right direction' do
      expect(HowManyBlocks.turn(EAST, 'R')).to eq(SOUTH)
      expect(HowManyBlocks.turn(EAST, 'L')).to eq(NORTH)
    end
  end

  context 'Moving' do
    it 'returns the new state' do
      initial_state = { direction: SOUTH, position: { x: 3, y: 1 } }

      state = HowManyBlocks.move(initial_state, 'L7')

      expect(state).to include(direction: EAST, position: { x: 10, y: 1 })
    end
  end

  context 'Offset' do
    it 'returns offset from the given position' do
      offset = HowManyBlocks.offset(WEST, 5)

      expect(offset).to include(dx: -5, dy: 0)
    end
  end
end

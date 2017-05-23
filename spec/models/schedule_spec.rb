require 'rails_helper'

RSpec.describe Schedule, type: :model do
	context 'Schedule fields describe' do

		it 'should have a title' do
			expect(Schedule.new('Sample').respond_to? 'title').to eq(true)
			expect(Schedule.new('Sample').respond_to? 'title=').to eq(true)
			expect(Schedule.new('Sample').title.instance_of? String).to eq(true)
		end

		it 'should have a timeline' do
			expect (Schedule.new('Sample').respond_to? 'timeline').to eq(true)
			expect (Schedule.new('Sample').timeline.instance_of? Timeline).to eq(true)
		end
	end

	context 'Timeline fields describe' do
		it 'should have an event' do
			expect (Timeline.new.respond_to? '')
		end
end

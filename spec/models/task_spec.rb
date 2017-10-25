require 'rails_helper'

RSpec.describe Task, type: :model do
  describe '#toggle_complete' do
    it 'should switch complete to false if it begas as true' do
    task = Task.create(complete: true)
    task.toggle_complete!
    expect(task.complete).to eq(false)
  end

  it 'should switch complete true if it began as false' do
  task = Task.create(complete: false)
  task.toggle_complete!
  expect(task.complete).to eq(true)
  end
 end
end


describe '#toggle_favorite' do
    it 'should switch favorite to false if it begas as true' do
    task = Task.create(favorite: true)
    task.toggle_favorite!
    expect(task.favorite).to eq(false)
  end

  it 'should switch favorite true if it began as false' do
  task = Task.create(favorite: false)
  task.toggle_favorite!
  expect(task.favorite).to eq(true)
  end
 

 describe '#overdue?' do
    it 'should be overdue if the time is greter then deadline' do
    task = Task.create(deadline: 1.hours.ago)
    expect(task.overdue?).to eq(true)
  end
   
   describe '#increment_priority!' do
    it 'should be overdue if the time is greter then deadline' do
    task = Task.create(priority: 4)
    task.increment_priority!
    expect(task.priority).to eq(5)
  end

describe '#decrement_priority!' do
    it 'should be overdue if the time is greter then deadline' do
    task = Task.create(priority: 4)
    task.decrement_priority!
    expect(task.priority).to eq(3)
  end

describe '#snooze_hour!' do
    it 'should be overdue if the time is greter then deadline' do
        time = Time.now
    task = Task.create(deadline: time)
    task.snooze_hour!
    expect(task.deadline).to eq(time + 1.hour)
  end
  end
end
end
end

end





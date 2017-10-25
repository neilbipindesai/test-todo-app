require 'rails_helper'

RSpec.describe List, type: :model do
 describe '#complete_all_tasks!' do
      it 'should mark all tasks from the list as complete' do
       list = List.create(name: "Chores")
       Task.create(
                   list_id: list.id,
                  complete: false,
                  name: "Take out the Trash"
                  )
       Task.create(
                  list_id: list.id,
                  complete: false,
                  name: "Mow the lawn"
                  )

       list.complete_all_tasks!
       list.tasks.each do |task|
        expect(task.complete).to eq(true) 
      end
     end
    end
   end



   describe '#snooze_all_tasks!' do
    it 'should put a snooze on all the task' do
      time = Time.now
      list = List.create(name: "Chores")
      Task.create(
                   list_id: list.id,
                   deadline: time,
                   name: "Take out the Trash"
                  )
       Task.create(
                  list_id: list.id,
                  deadline: time,
                  name: "Mow the lawn"
                  )
        list.snooze_all_tasks!
        list.tasks.each do |task|
        expect(task.deadline).to eq(time + 1.hour)
     end
    end
   end

    describe '#snooze_all_tasks!' do
    it 'should mark all tasks from the list as snoozed' do
      list = List.create(name: "Chors")
      time_now_object = Time.now
      Task.create(
                  list_id: list.id,
                  complete: false,
                  deadline: time_now_object,
                  name: "Take out the trash"
                  )
      Task.create(
                  list_id: list.id,
                  complete: false,
                  deadline: time_now_object,
                  name: "Mow the lawn"
                  )
      list.snooze_all_tasks!
      list.tasks.each do |task|
        expect(task.deadline).to eq(time_now_object + 1.hour)
      end
    end
  end
  
    describe  '#total_duration'   do
      it 'should give sum of total and task duration' do
        total = 0
        list = List.create(name: "Chores")
        Task.create(
                     list_id: list.id,
                     duration: total,
                     name: "Take out the trash"
                     )
        Task.create(
                     list_id: list.id,
                     duration: total,
                     name: "Take out the trash"
                     )
        list.total_duration
        list.tasks.each do |task|
          expect(task.duration).to eq(total)
    end
  end
end


  describe '#incomplete' do
    it 'should give an array of incomplete task' do
        
        list = List.create(name: "Chores")
        Task.create(
                     list_id: list.id,
                     complete: true,
                     name: "Take out the trash"
                     )
        Task.create(
                     list_id: list.id,
                     complete: true,
                     name: "Take out the trash"
                     )
        list.incomplete_tasks

   



        




                  

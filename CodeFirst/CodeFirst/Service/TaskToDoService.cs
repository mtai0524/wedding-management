using CodeFirst.Data;
using CodeFirst.Models.Entities;
using Microsoft.EntityFrameworkCore;

namespace CodeFirst.Service
{
    public class TaskToDoService
    {
        private readonly ApplicationDbContext _dbContext;

        public TaskToDoService(ApplicationDbContext dbContext)
        {
            this._dbContext = dbContext;
        }
        public List<TaskToDo> GetListTaskByProjectId(int projectId)
        {
            var tasks = _dbContext.TaskToDo
                    .Where(x => x.ProjectId == projectId)
                    .Include(x=> x.User)
                    .ToList();
            return tasks;
        }
    
        public async Task<TaskToDo> GetTaskToDoByTaskId(int taskId)
        {
            var taskToDo = await _dbContext.TaskToDo.FirstOrDefaultAsync(x => x.TaskId == taskId);
            return taskToDo;
        }
      
    }
}

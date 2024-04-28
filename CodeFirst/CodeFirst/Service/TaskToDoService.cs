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
                    .ToList();
            return tasks;
        }
        public async Task<List<Project>> GetAllProjectsAsync()
        {
            return await _dbContext.Projects.ToListAsync();
        }

        public async Task<List<TaskToDo>> GetAllTasksAsync()
        {
            return await _dbContext.TaskToDo.ToListAsync();
        }
        public void UpdateTaskPosition(int taskId, int targetTaskId)
        {
            var task = _dbContext.TaskToDo.FirstOrDefault(t => t.TaskId == taskId);
            var targetTask = _dbContext.TaskToDo.FirstOrDefault(t => t.TaskId == targetTaskId);

            if (task != null && targetTask != null)
            {
                // Swap positions
                int? tempPosition = task.Position;
                task.Position = targetTask.Position;
                targetTask.Position = tempPosition;

                _dbContext.SaveChanges();
            }
        }
    }
}

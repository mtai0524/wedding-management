using CodeFirst.Data;
using CodeFirst.Models.Entities;
using Microsoft.EntityFrameworkCore;

namespace CodeFirst.Service
{
    public class ProjectService
    {
        private readonly ApplicationDbContext dbContext;

        public ProjectService(ApplicationDbContext dbContext)
        {
            this.dbContext = dbContext;
        }
       

        public async Task<List<Project>> GetAllProjects()
        {
            return await dbContext.Projects.ToListAsync();
        }

        public async Task<List<TaskToDo>> GetAllTasks()
        {
            return await dbContext.TaskToDo.ToListAsync();
        }

        public async Task<List<Project>> UpdateProjectState(List<Project> projects, List<TaskToDo> tasks)
        {
            foreach (var project in projects)
            {
                project.TaskToDoProp = await dbContext.TaskToDo.Where(t => t.ProjectId == project.ProjectId)
                                            .OrderBy(t => t.Position)
                                            .ToListAsync();
            }
            return projects;
        }


    }
}

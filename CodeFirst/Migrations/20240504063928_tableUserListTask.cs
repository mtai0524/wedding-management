using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace CodeFirst.Migrations
{
    /// <inheritdoc />
    public partial class tableUserListTask : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "UserListTask",
                columns: table => new
                {
                    UserListTaskId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    TaskId = table.Column<int>(type: "int", nullable: true),
                    UserId = table.Column<string>(type: "nvarchar(450)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_UserListTask", x => x.UserListTaskId);
                    table.ForeignKey(
                        name: "FK_UserListTask_AspNetUsers_UserId",
                        column: x => x.UserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id");
                    table.ForeignKey(
                        name: "FK_UserListTask_TaskToDo_TaskId",
                        column: x => x.TaskId,
                        principalTable: "TaskToDo",
                        principalColumn: "TaskId");
                });

            migrationBuilder.CreateIndex(
                name: "IX_UserListTask_TaskId",
                table: "UserListTask",
                column: "TaskId");

            migrationBuilder.CreateIndex(
                name: "IX_UserListTask_UserId",
                table: "UserListTask",
                column: "UserId");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "UserListTask");
        }
    }
}

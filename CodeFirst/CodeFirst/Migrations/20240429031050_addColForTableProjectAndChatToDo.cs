using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace CodeFirst.Migrations
{
    /// <inheritdoc />
    public partial class addColForTableProjectAndChatToDo : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<DateTime>(
                name: "CreatedAt",
                table: "TaskToDo",
                type: "datetime2",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "Priority",
                table: "TaskToDo",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddColumn<DateTime>(
                name: "UpdatedAt",
                table: "TaskToDo",
                type: "datetime2",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "UserId",
                table: "TaskToDo",
                type: "nvarchar(450)",
                nullable: true);

            migrationBuilder.AddColumn<DateTime>(
                name: "CreatedAt",
                table: "Project",
                type: "datetime2",
                nullable: true);

            migrationBuilder.AddColumn<DateTime>(
                name: "UpdatedAt",
                table: "Project",
                type: "datetime2",
                nullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_TaskToDo_UserId",
                table: "TaskToDo",
                column: "UserId");

            migrationBuilder.AddForeignKey(
                name: "FK_TaskToDo_AspNetUsers_UserId",
                table: "TaskToDo",
                column: "UserId",
                principalTable: "AspNetUsers",
                principalColumn: "Id");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_TaskToDo_AspNetUsers_UserId",
                table: "TaskToDo");

            migrationBuilder.DropIndex(
                name: "IX_TaskToDo_UserId",
                table: "TaskToDo");

            migrationBuilder.DropColumn(
                name: "CreatedAt",
                table: "TaskToDo");

            migrationBuilder.DropColumn(
                name: "Priority",
                table: "TaskToDo");

            migrationBuilder.DropColumn(
                name: "UpdatedAt",
                table: "TaskToDo");

            migrationBuilder.DropColumn(
                name: "UserId",
                table: "TaskToDo");

            migrationBuilder.DropColumn(
                name: "CreatedAt",
                table: "Project");

            migrationBuilder.DropColumn(
                name: "UpdatedAt",
                table: "Project");
        }
    }
}

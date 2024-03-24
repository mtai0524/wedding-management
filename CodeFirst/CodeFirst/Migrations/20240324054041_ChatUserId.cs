using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace CodeFirst.Migrations
{
    /// <inheritdoc />
    public partial class ChatUserId : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Username",
                table: "Chat");

            migrationBuilder.RenameColumn(
                name: "Id",
                table: "Chat",
                newName: "ChatId");

            migrationBuilder.AddColumn<string>(
                name: "UserId",
                table: "Chat",
                type: "nvarchar(450)",
                nullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_Chat_UserId",
                table: "Chat",
                column: "UserId");

            migrationBuilder.AddForeignKey(
                name: "FK_Chat_AspNetUsers_UserId",
                table: "Chat",
                column: "UserId",
                principalTable: "AspNetUsers",
                principalColumn: "Id");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Chat_AspNetUsers_UserId",
                table: "Chat");

            migrationBuilder.DropIndex(
                name: "IX_Chat_UserId",
                table: "Chat");

            migrationBuilder.DropColumn(
                name: "UserId",
                table: "Chat");

            migrationBuilder.RenameColumn(
                name: "ChatId",
                table: "Chat",
                newName: "Id");

            migrationBuilder.AddColumn<string>(
                name: "Username",
                table: "Chat",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "");
        }
    }
}

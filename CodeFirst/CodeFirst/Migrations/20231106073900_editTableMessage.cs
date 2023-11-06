using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace CodeFirst.Migrations
{
    /// <inheritdoc />
    public partial class editTableMessage : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "ToRoomId",
                table: "Message");

            migrationBuilder.RenameColumn(
                name: "FromUserId",
                table: "Message",
                newName: "UserId");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "UserId",
                table: "Message",
                newName: "FromUserId");

            migrationBuilder.AddColumn<int>(
                name: "ToRoomId",
                table: "Message",
                type: "int",
                nullable: true);
        }
    }
}

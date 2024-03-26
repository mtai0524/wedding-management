using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace CodeFirst.Migrations
{
    /// <inheritdoc />
    public partial class addPKChatRoomInChatDataId2 : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "ChatRoomDataId",
                table: "Chat",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.CreateIndex(
                name: "IX_Chat_ChatRoomDataId",
                table: "Chat",
                column: "ChatRoomDataId");

            migrationBuilder.AddForeignKey(
                name: "FK_Chat_ChatRoom_ChatRoomDataId",
                table: "Chat",
                column: "ChatRoomDataId",
                principalTable: "ChatRoom",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Chat_ChatRoom_ChatRoomDataId",
                table: "Chat");

            migrationBuilder.DropIndex(
                name: "IX_Chat_ChatRoomDataId",
                table: "Chat");

            migrationBuilder.DropColumn(
                name: "ChatRoomDataId",
                table: "Chat");
        }
    }
}

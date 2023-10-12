using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace CodeFirst.Migrations
{
    /// <inheritdoc />
    public partial class addColHallInvoice : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "HallId",
                table: "Invoice",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.CreateIndex(
                name: "IX_Invoice_HallId",
                table: "Invoice",
                column: "HallId");

            migrationBuilder.AddForeignKey(
                name: "FK_Invoice_Hall_HallId",
                table: "Invoice",
                column: "HallId",
                principalTable: "Hall",
                principalColumn: "HallId",
                onDelete: ReferentialAction.NoAction);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Invoice_Hall_HallId",
                table: "Invoice");

            migrationBuilder.DropIndex(
                name: "IX_Invoice_HallId",
                table: "Invoice");

            migrationBuilder.DropColumn(
                name: "HallId",
                table: "Invoice");
        }
    }
}

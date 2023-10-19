using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace CodeFirst.Migrations
{
    /// <inheritdoc />
    public partial class addColTableHall : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "Capacity",
                table: "Hall",
                type: "int",
                nullable: true);

            migrationBuilder.AddColumn<DateTime>(
                name: "HallDate",
                table: "Hall",
                type: "datetime2",
                nullable: true);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Capacity",
                table: "Hall");

            migrationBuilder.DropColumn(
                name: "HallDate",
                table: "Hall");
        }
    }
}
